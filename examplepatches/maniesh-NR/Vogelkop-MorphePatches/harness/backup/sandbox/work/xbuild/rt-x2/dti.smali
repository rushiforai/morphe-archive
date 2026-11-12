.class public abstract Ldti;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/regex/Pattern;

.field public static final b:Ljava/util/regex/Pattern;

.field public static final c:Ljava/util/regex/Pattern;

.field public static final d:Ljava/util/regex/Pattern;

.field public static final e:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "((?i)google(\\.([a-z]{2,3})){1,2})/.*[?&#]q=.+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ldti;->a:Ljava/util/regex/Pattern;

    const-string v0, "((?i)yandex(\\.([a-z]{2,3})){1,2})/.*[?&]text=.+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ldti;->b:Ljava/util/regex/Pattern;

    const-string v0, "((?i)([a-z0-9]+\\.)*yahoo(\\.([a-z]{2,3})){1,2})/.*[?&](q=|p=).+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ldti;->c:Ljava/util/regex/Pattern;

    const-string v0, "((?i)https?://duckduckgo\\.com)/\\?(q|.*[&]q)=.+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ldti;->d:Ljava/util/regex/Pattern;

    const-string v0, "((?i)startpage\\.com)/do/search/?\\?(q|.*[&]q)=.+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ldti;->e:Ljava/util/regex/Pattern;

    return-void
.end method

.method public static a(Ljava/lang/String;)Z
    .registers 2

    sget-object v0, Laik;->a:[Ljava/lang/String;

    invoke-static {p0, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ldti;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method
