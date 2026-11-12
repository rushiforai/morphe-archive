.class public abstract Lfj9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/List;

.field public static final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const-string v0, ".ytmPaidContentOverlayHost"

    const-string v1, ".ytp-caption-window-container"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lfj9;->a:Ljava/util/List;

    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const-string v2, ","

    const-string v3, "\""

    const-string v4, "\""

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\n        (function() {\n          if (!window.__operaForcePipOverlays) {\n            window.__operaForcePipOverlays = true;\n            const selector = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ";\n            const hidden = new Map();\n            const hide = el => {\n              if (hidden.has(el)) return;\n              const style = getComputedStyle(el);\n              if (style.display === \"none\" || style.visibility === \"hidden\") return;\n              hidden.set(el, [\n                el.style.getPropertyValue(\"display\"),\n                el.style.getPropertyPriority(\"display\"),\n              ]);\n              el.style.setProperty(\"display\", \"none\", \"important\");\n            };\n            const hideAll = () => document.querySelectorAll(selector).forEach(hide);\n            const observer = new MutationObserver(hideAll);\n            document.addEventListener(\"enterpictureinpicture\", () => {\n              hideAll();\n              observer.observe(document.documentElement, { childList: true, subtree: true });\n            }, true);\n            document.addEventListener(\"leavepictureinpicture\", () => {\n              observer.disconnect();\n              hidden.forEach(([value, priority], el) => {\n                if (value) el.style.setProperty(\"display\", value, priority);\n                else el.style.removeProperty(\"display\");\n              });\n              hidden.clear();\n            }, true);\n          }\n          const videos = Array.from(document.getElementsByTagName(\"video\"));\n          const video = videos.find(v => !v.paused) ?? videos[0];\n          if (!video) return false;\n          video.removeAttribute(\"disablepictureinpicture\");\n          if (video.paused) video.play();\n          video.requestPictureInPicture();\n          return true;\n        })();\n    "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkik;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lfj9;->b:Ljava/lang/String;

    return-void
.end method
