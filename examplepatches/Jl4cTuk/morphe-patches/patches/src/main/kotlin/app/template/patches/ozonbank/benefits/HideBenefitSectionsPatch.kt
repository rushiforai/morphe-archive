package app.template.patches.ozonbank.benefits

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozonbank.home.FintechWebViewPageFinishedFingerprint
import app.template.patches.ozonbank.shared.Constants.COMPATIBILITY_OZON_BANK_CURRENT

private val allBenefitSectionTitles = listOf(
    "Розыгрыши и акции",
    "Бонусы за рекомендации",
    "Купить за 1₽",
    "Выгода от партнёров",
    "Для покупок на Ozon",
    "Ozon Premium",
)

private fun serializeJavaScriptStrings(values: List<String>) =
    values.joinToString(prefix = "[", postfix = "]") { "'$it'" }

@Suppress("unused")
val hideOzonBankBenefitSectionsPatch = bytecodePatch(
    name = "Hide Ozon Bank benefit sections",
    description = "Adds options to hide selected non-advertising sections from the Benefit page.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_OZON_BANK_CURRENT)

    val hideBuyForOneRuble by booleanOption(
        key = "hideBuyForOneRuble",
        default = false,
        title = "Hide Buy for 1 ruble",
        description = "Hides the Buy for 1 ruble product carousel.",
    )
    val hidePartnerBenefits by booleanOption(
        key = "hidePartnerBenefits",
        default = false,
        title = "Hide Partner benefits",
        description = "Hides the Partner benefits section.",
    )
    val hideOzonShoppingBenefits by booleanOption(
        key = "hideOzonShoppingBenefits",
        default = false,
        title = "Hide For shopping on Ozon",
        description = "Hides the For shopping on Ozon section.",
    )
    val hideOzonPremium by booleanOption(
        key = "hideOzonPremium",
        default = false,
        title = "Hide Ozon Premium",
        description = "Hides the Ozon Premium benefits section.",
    )

    execute {
        val selectedTitles = buildList {
            if (hideBuyForOneRuble == true) add("Купить за 1₽")
            if (hidePartnerBenefits == true) add("Выгода от партнёров")
            if (hideOzonShoppingBenefits == true) add("Для покупок на Ozon")
            if (hideOzonPremium == true) add("Ozon Premium")
        }

        if (selectedTitles.isNotEmpty()) {
            val selectedTitlesScript = serializeJavaScriptStrings(selectedTitles)
            val allTitlesScript = serializeJavaScriptStrings(allBenefitSectionTitles)
            val script = """
                (function(){
                  if(window.__morpheOzonBankBenefitSections){return;}
                  window.__morpheOzonBankBenefitSections=true;
                  var selectedTitles=$selectedTitlesScript;
                  var allTitles=$allTitlesScript;
                  var normalize=function(value){return (value||'').replace(/\\s+/g,' ').replace(/\\s+₽/g,'₽').trim();};
                  var isBenefitPage=function(){
                    var path=(window.location&&window.location.pathname||'').toLowerCase();
                    return path==='/m/lk/bonus'||path.indexOf('/m/lk/bonus/')===0;
                  };
                  var protectsStructure=function(element){
                    if(!element){return false;}
                    var text=normalize(element.textContent);
                    var hasQuickActions=text.indexOf('QR-код')!==-1&&text.indexOf('Пополнить')!==-1&&text.indexOf('Перевести')!==-1;
                    return text.indexOf('Основной счёт')!==-1||text.indexOf('Последние операции')!==-1||hasQuickActions;
                  };
                  var leaves=function(title){
                    return Array.prototype.filter.call(document.querySelectorAll('body *'),function(element){
                      if(normalize(element.textContent).indexOf(title)===-1){return false;}
                      for(var i=0;i<element.children.length;i++){
                        if(normalize(element.children[i].textContent).indexOf(title)!==-1){return false;}
                      }
                      return true;
                    });
                  };
                  var containsOtherSection=function(text,title){
                    for(var i=0;i<allTitles.length;i++){
                      if(allTitles[i]!==title&&text.indexOf(allTitles[i])!==-1){return true;}
                    }
                    return false;
                  };
                  var hideSection=function(title){
                    var pageAnchors=leaves('Выгода за покупки');
                    if(pageAnchors.length===0){pageAnchors=leaves('Выгода сейчас');}
                    if(pageAnchors.length===0){return;}
                    var pageAnchor=pageAnchors[0];
                    leaves(title).forEach(function(element){
                      if((pageAnchor.compareDocumentPosition(element)&4)===0){return;}
                      var current=element;
                      var best=null;
                      while(current&&current!==document.body){
                        if(current.contains(pageAnchor)){break;}
                        var text=normalize(current.textContent);
                        if(containsOtherSection(text,title)||protectsStructure(current)){break;}
                        var rect=current.getBoundingClientRect();
                        if(rect.width>=window.innerWidth*0.75&&rect.height>=70&&rect.height<=600){best=current;}
                        if(rect.height>600){break;}
                        current=current.parentElement;
                      }
                      var target=best||element;
                      if(!protectsStructure(target)){target.style.setProperty('display','none','important');}
                    });
                  };
                  var sweep=function(){if(isBenefitPage()){selectedTitles.forEach(hideSection);}};
                  var queued=false;
                  var schedule=function(){
                    if(queued){return;}
                    queued=true;
                    window.requestAnimationFrame(function(){queued=false;sweep();});
                  };
                  var start=function(){
                    if(!document.body){return;}
                    new MutationObserver(schedule).observe(document.body,{childList:true,subtree:true,characterData:true});
                    sweep();
                  };
                  if(document.body){start();}else{document.addEventListener('DOMContentLoaded',start,{once:true});}
                })();
            """.trimIndent().replace("\n", " ")

            FintechWebViewPageFinishedFingerprint.method.addInstructions(
                0,
                """
                    const-string/jumbo v0, "$script"
                    const/4 v1, 0x0
                    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
                """.trimIndent(),
            )
        }
    }
}
