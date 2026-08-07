.class Lcom/momo/mcamera/mask/EffectGroupFilter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ssl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/EffectGroupFilter;->addEffectFilterItem(Lcom/momo/mcamera/mask/bean/EffectFilterItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/EffectGroupFilter;

.field final synthetic val$finalFilter:Ll/i4;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/EffectGroupFilter;Ll/i4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter$1;->this$0:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/EffectGroupFilter$1;->val$finalFilter:Ll/i4;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onRenderFinish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter$1;->this$0:Lcom/momo/mcamera/mask/EffectGroupFilter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter$1;->val$finalFilter:Ll/i4;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/momo/mcamera/mask/EffectGroupFilter;->access$000(Lcom/momo/mcamera/mask/EffectGroupFilter;Ll/i4;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
