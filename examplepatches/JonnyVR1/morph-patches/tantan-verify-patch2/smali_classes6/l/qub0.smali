.class public final synthetic Ll/qub0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zub0;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/zub0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qub0;->a:Ll/zub0;

    iput-object p2, p0, Ll/qub0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qub0;->a:Ll/zub0;

    iget-object p0, p0, Ll/qub0;->b:Ljava/util/List;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/zub0;->c(Ll/zub0;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
