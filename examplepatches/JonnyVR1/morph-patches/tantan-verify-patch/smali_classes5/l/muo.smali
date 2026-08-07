.class public final synthetic Ll/muo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/hvo;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/hvo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/muo;->a:Ljava/util/List;

    iput-object p2, p0, Ll/muo;->b:Ll/hvo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/muo;->a:Ljava/util/List;

    iget-object p0, p0, Ll/muo;->b:Ll/hvo;

    invoke-static {v0, p0, p1}, Ll/hvo;->a(Ljava/util/List;Ll/hvo;Landroid/view/View;)V

    return-void
.end method
