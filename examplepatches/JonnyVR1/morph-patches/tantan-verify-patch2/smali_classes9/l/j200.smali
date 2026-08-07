.class public final synthetic Ll/j200;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j200;->a:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j200;->a:Landroid/util/Pair;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;->w(Landroid/util/Pair;Landroid/view/View;)V

    return-void
.end method
