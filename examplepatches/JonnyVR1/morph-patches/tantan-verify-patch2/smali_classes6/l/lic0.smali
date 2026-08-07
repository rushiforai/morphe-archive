.class public final synthetic Ll/lic0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mic0;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ll/mic0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lic0;->a:Ll/mic0;

    iput-object p2, p0, Ll/lic0;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lic0;->a:Ll/mic0;

    iget-object p0, p0, Ll/lic0;->b:Ljava/lang/Object;

    invoke-static {v0, p0, p1}, Ll/mic0;->E(Ll/mic0;Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method
