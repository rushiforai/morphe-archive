.class public final Ll/fbg$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fbg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/gbg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fbg$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ll/fbg;
    .locals 1

    .line 1
    new-instance v0, Ll/fbg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fbg;-><init>(Ll/fbg$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b(Ljava/lang/String;)Ll/fbg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fbg$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/fbg$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/fbg$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/fbg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fbg$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/fbg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fbg$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/fbg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fbg$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
