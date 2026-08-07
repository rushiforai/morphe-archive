.class public final synthetic Ll/brb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic b:Landroidx/appcompat/widget/SearchView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Landroidx/appcompat/widget/SearchView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/brb0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p2, p0, Ll/brb0;->b:Landroidx/appcompat/widget/SearchView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/brb0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object p0, p0, Ll/brb0;->b:Landroidx/appcompat/widget/SearchView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/app/PutongAct;->L1(Lcom/p1/mobile/putong/app/PutongAct;Landroidx/appcompat/widget/SearchView;)V

    return-void
.end method
