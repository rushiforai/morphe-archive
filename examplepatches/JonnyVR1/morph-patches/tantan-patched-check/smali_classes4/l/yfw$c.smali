.class public Ll/yfw$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yfw;->j(Lcom/p1/mobile/putong/core/data/FateRadar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/FateRadar;

.field public final synthetic b:Ll/yfw;


# direct methods
.method public constructor <init>(Ll/yfw;Lcom/p1/mobile/putong/core/data/FateRadar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/yfw$c;->b:Ll/yfw;

    .line 2
    .line 3
    iput-object p2, p0, Ll/yfw$c;->a:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yfw$c;->a:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FateRadar;->searchConditions:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 4
    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->option:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/yfw$c;->b:Ll/yfw;

    .line 8
    .line 9
    iget-object p0, p0, Ll/yfw;->l:Ll/xfw;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/xfw;->A0(Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yfw$c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
