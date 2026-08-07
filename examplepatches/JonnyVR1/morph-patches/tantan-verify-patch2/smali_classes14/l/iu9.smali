.class public final synthetic Ll/iu9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Landroidx/appcompat/widget/ActionMenuView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/widget/ActionMenuView;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iu9;->a:Landroidx/appcompat/widget/ActionMenuView;

    iput-object p2, p0, Ll/iu9;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iu9;->a:Landroidx/appcompat/widget/ActionMenuView;

    iget-object p0, p0, Ll/iu9;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/ju9;->o(Landroidx/appcompat/widget/ActionMenuView;Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
