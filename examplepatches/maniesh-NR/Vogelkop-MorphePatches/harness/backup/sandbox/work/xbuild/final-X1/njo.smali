.class public abstract Lnjo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "<script\\s+[^>]*\\bsrc\\s*=\\s*([\"\'])mraid\\.js\\1[^>]*>\\s*</script>\\n*"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lnjo;->a:Ljava/util/regex/Pattern;

    return-void
.end method
