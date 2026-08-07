.class public final synthetic Ll/crm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/erm0;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;


# direct methods
.method public synthetic constructor <init>(Ll/erm0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crm0;->a:Ll/erm0;

    iput-boolean p2, p0, Ll/crm0;->b:Z

    iput-object p3, p0, Ll/crm0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/crm0;->a:Ll/erm0;

    iget-boolean v1, p0, Ll/crm0;->b:Z

    iget-object p0, p0, Ll/crm0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    check-cast p1, Ll/ugd0;

    invoke-static {v0, v1, p0, p1}, Ll/erm0;->b4(Ll/erm0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ugd0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
