.class public final synthetic Ll/am10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bm10;


# direct methods
.method public synthetic constructor <init>(Ll/bm10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/am10;->a:Ll/bm10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/am10;->a:Ll/bm10;

    check-cast p1, Ll/nsv;

    invoke-static {p0, p1}, Ll/bm10;->y(Ll/bm10;Ll/nsv;)Lcom/p1/mobile/putong/live/base/view/RollItemView;

    move-result-object p0

    return-object p0
.end method
