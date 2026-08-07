.class public Ll/bkg$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bkg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Ll/uoe0;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ll/x20;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/bkg$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkg$a;->e:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/bkg$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/bkg$a;->a:I

    return p0
.end method

.method public static bridge synthetic c(Ll/bkg$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkg$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/bkg$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkg$a;->c:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public e()Ll/bkg;
    .locals 1

    .line 1
    new-instance v0, Ll/bkg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bkg;-><init>(Ll/bkg$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public f(Ll/x20;)Ll/bkg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bkg$a;->e:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(I)Ll/bkg$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/bkg$a;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/uoe0;)Ll/bkg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bkg$a;->b:Ll/uoe0;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;)Ll/bkg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bkg$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/bkg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bkg$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
