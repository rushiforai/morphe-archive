.class public final synthetic Ll/at60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rt60;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/rt60;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/at60;->a:Ll/rt60;

    iput-object p2, p0, Ll/at60;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/at60;->a:Ll/rt60;

    iget-object p0, p0, Ll/at60;->b:Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/rt60;->k(Ll/rt60;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
