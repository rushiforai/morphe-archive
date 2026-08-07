.class public final synthetic Ll/kze0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/b;

.field public final synthetic b:Lv/VCheckBox;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/b;Lv/VCheckBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kze0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    iput-object p2, p0, Ll/kze0;->b:Lv/VCheckBox;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kze0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    iget-object p0, p0, Ll/kze0;->b:Lv/VCheckBox;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->w(Lcom/p1/mobile/putong/core/ui/settings/b;Lv/VCheckBox;)V

    return-void
.end method
