.class public final synthetic Ll/rnp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(JLandroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/rnp0;->a:J

    iput-object p3, p0, Ll/rnp0;->b:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/rnp0;->a:J

    iget-object p0, p0, Ll/rnp0;->b:Landroid/view/View$OnClickListener;

    invoke-static {v0, v1, p0, p1}, Ll/ynp0;->d(JLandroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
