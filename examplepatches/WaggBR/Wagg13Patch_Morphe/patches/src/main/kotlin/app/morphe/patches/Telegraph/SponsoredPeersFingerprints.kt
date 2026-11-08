/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * graphmessenger/misc/ads/Fingerprints.kt — somente os dois fingerprints de
 * readParams, que faltavam no nosso RemoveAdsPatch.kt):
 * https://github.com/hxreborn/morphe-patches
 *
 * Diferente da mensagem patrocinada dentro do chat (que já tratamos), o item
 * "Anúncio" fixado no topo da lista de chats vem de um mecanismo SEPARADO:
 * TL_contacts_sponsoredPeers (um "contato"/canal patrocinado). Bloquear só a
 * requisição (como já fazíamos) não impede a linha vazia "Nenhum resultado"
 * de aparecer; é preciso impedir também o PARSE da resposta, fazendo
 * readParams() não preencher o objeto — connect-the-dots: sem conteúdo
 * parseado, a UI não tem o que desenhar na linha.
 */
package app.morphe.patches.telegraph.ads

import app.morphe.patcher.Fingerprint

@Suppress("unused")
internal object SponsoredPeersReadParamsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/tgnet/TLRPC\$TL_contacts_sponsoredPeers;",
    name = "readParams",
)

@Suppress("unused")
internal object SponsoredMessagesReadParamsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/tgnet/TLRPC\$TL_messages_sponsoredMessages;",
    name = "readParams",
)
