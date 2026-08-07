.class public Ll/bkg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bkg$a;
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/uoe0;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ll/x20;


# direct methods
.method public constructor <init>(Ll/bkg$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bkg$a;->b(Ll/bkg$a;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/bkg;->a:I

    .line 9
    .line 10
    iget-object v0, p1, Ll/bkg$a;->b:Ll/uoe0;

    .line 11
    .line 12
    iput-object v0, p0, Ll/bkg;->b:Ll/uoe0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/bkg$a;->d(Ll/bkg$a;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/bkg;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Ll/bkg$a;->c(Ll/bkg$a;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/bkg;->d:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Ll/bkg$a;->a(Ll/bkg$a;)Ll/x20;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/bkg;->e:Ll/x20;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bkg;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "js"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
