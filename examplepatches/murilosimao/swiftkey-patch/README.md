# SwiftKey Clean Patches

Patches incrementais para **Microsoft SwiftKey 9.13.19.3** (`com.touchtype.swiftkey`,
version code `1236467760`). Projeto independente, sem vínculo com Microsoft ou Morphe.

| Patch | Resultado |
|---|---|
| Disable cloud sign-in prompt | Desativa as decisões de convite automático ao login na tela inicial. Configuração local e login manual continuam disponíveis. |
| Disable telemetry | Interrompe os registros e upload de telemetria identificados, Adjust e a coleta descrita no patch original. Não representa uma auditoria de todo o tráfego de rede do app. |
| Customise toolbar | Adiciona um editor para selecionar a quantidade e a ordem dos atalhos. O botão **Reordenar itens** do teclado também abre esse editor. |

Os dois primeiros patches foram adaptados do [Hooman](https://github.com/arandomhooman/hoomans-morphe-patches).
Veja [atribuição e licenças](THIRD_PARTY_NOTICES.md).

## Adicionar ao Morphe

Em **Fontes → Adicionar → Remota**, use:

```text
https://github.com/murilosimao/swiftkey-patch
```

Ou abra [Adicionar fonte no Morphe](https://morphe.software/add-source?github=murilosimao/swiftkey-patch).
Para adicionar ao índice comunitário, informe a mesma URL do repositório.
O arquivo `patches-list.json` na raiz é o catálogo que esse formulário consulta;
`patches-bundle.json` aponta para o `.mpp` da release. O ícone próprio é opcional.

Também é possível baixar o `.mpp` da [release experimental](https://github.com/murilosimao/swiftkey-patch/releases/tag/v0.1.1)
e adicioná-lo como fonte **Local**. O carregamento no Manager ainda precisa ser
validado no Android; a geração e aplicação pelo Desktop foram verificadas.

## Toolbar

1. No teclado, abra **Mais opções → Reordenar itens**. A partir da 0.1.1, ele abre o novo editor **Atalhos da barra**. Também há acesso em **Configurações → Personalizar toolbar**, abaixo de **Layout e teclas**.
2. Desmarque os itens que não quer mostrar e use ↑ / ↓ para ordenar. Por exemplo, deixe apenas Área de transferência e GIF: a barra terá esses dois atalhos e Mais opções.
3. Toque em **Salvar alterações** e abra o teclado novamente.

Não é necessário preencher seis posições. O editor de arrastar com seis posições
das versões anteriores era a tela original do SwiftKey; a versão 0.1.0 ainda
deixava o botão do teclado abrindo essa tela. A versão 0.1.1 corrige esse acesso.

As escolhas ficam no aparelho. A montagem nativa da toolbar distribui os itens
visíveis, sem reservar espaços para os ocultos. **Mais opções** permanece acessível;
é necessário pelo menos um outro atalho para o layout nativo. Itens indisponíveis
naquele contexto são ignorados; Configurações serve como fallback quando possível.
O número exibido se adapta à largura. A lista original de **Mais opções** permanece
disponível. **Restaurar padrão do SwiftKey** devolve o controle ao app.

A personalização começa desligada, preservando a toolbar original até você salvar
suas escolhas. O editor usa tema claro/escuro e não lê o texto digitado.

## Estado da primeira versão

**Experimental.** Os três patches foram aplicados ao APKM 9.13.19.3 com
validação dos fingerprints, reconstrução e assinatura do APK. Os testes de seleção
e da tela de edição rodam localmente. O teclado completo e o alinhamento visual
em aparelho real ainda precisam de validação; aplicar o patch não demonstra
compatibilidade de todos os recursos do SwiftKey.

O APK modificado tem outra assinatura. Não substitui normalmente uma instalação
oficial com a mesma identificação. Planeje a migração dos dados e o teste antes
de remover a instalação existente; este projeto não desinstala nem instala apps.

## Compilar

Requisitos: JDK 21+, Python 3.11+, `curl` e Android SDK com
`platforms;android-36`. Configure `JAVA_HOME` e `ANDROID_HOME` conforme seu ambiente.
No Mac com Homebrew, os scripts reconhecem o JDK 21 instalado pelo Homebrew.

```sh
chmod +x gradlew scripts/*.sh
./scripts/build.sh
```

As ferramentas públicas são baixadas com versões e hashes fixos.
**Nenhum token do GitHub é necessário para compilar.** O build usa as APIs do
Patcher 2.3.0 incluídas no Desktop 2.1.1 como dependência somente de compilação.
O runtime do Desktop não é empacotado no bundle.

O mesmo build gera `patches-list.json` usando o gerador do template oficial,
adaptado para ler explicitamente o bundle compilado. O gerador fica no módulo JVM
`catalog` e não entra no `.mpp`. Ele também valida a versão, o link do artefato e a
data dos metadados no formato do Manager. Não edite o catálogo manualmente.

Saída: `patches/build/libs/swiftkey-clean-patches-0.1.1.mpp`, com classes JVM e DEX
para os carregadores do Desktop e Android. A extensão do teclado contém apenas DEX.

## Aplicar ao seu APK ou APKM original

```sh
./scripts/patch.sh /caminho/swiftkey-original.apkm
```

Saída padrão: `artifacts/swiftkey-clean-9.13.19.3.apk` e relatório JSON em
`artifacts/patch-result.json`. O script não instala o resultado.
Use o arquivo original a cada build; não aplique sucessivamente sobre APKs já modificados.
Mantenha a chave local usada pelo Desktop para assinar as próximas atualizações.

Você também pode carregar o `.mpp` no Morphe Desktop. Esta primeira versão foi
validada com Desktop 2.1.1; a execução pelo Manager no Android ainda não foi testada.

## Evolução

Ao publicar uma atualização, incremente `version` em `gradle.properties` e atualize
`patches-bundle.json` para o novo arquivo de release. O script de aplicação lê a
versão do projeto automaticamente.

Os patches são independentes. As mudanças ficam em `patches/`; o editor e suas
regras ficam em `extensions/swiftkey/`. A ponte para as classes ofuscadas é gerada
ao aplicar o patch, sem empacotar classes falsas do app. Padrões ambíguos interrompem
a aplicação em vez de selecionar arbitrariamente um método.

Para atualizar o SwiftKey, analise o novo APK, ajuste os fingerprints e o alvo,
rode os testes e aplique todos os patches desejados ao novo original. A compatibilidade
com outras versões, incluindo a 9.13.13.5, não é declarada neste bundle.

Licença: [GPL-3.0](LICENSE).
