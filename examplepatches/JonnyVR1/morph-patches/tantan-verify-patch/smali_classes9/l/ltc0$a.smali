.class public Ll/ltc0$a;
.super Ll/ur2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ltc0;->E0(Lcom/p1/mobile/putong/core/data/RedPacket;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ltc0;


# direct methods
.method public constructor <init>(Ll/ltc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ltc0$a;->a:Ll/ltc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ur2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ltc0$a;->a:Ll/ltc0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ltc0;->o0(Ll/ltc0;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ztc0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ztc0;->P()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
