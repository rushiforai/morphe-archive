.class public final synthetic Ll/sub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zub0;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/zub0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sub0;->a:Ll/zub0;

    iput-object p2, p0, Ll/sub0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sub0;->a:Ll/zub0;

    iget-object p0, p0, Ll/sub0;->b:Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/zub0;->d(Ll/zub0;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
