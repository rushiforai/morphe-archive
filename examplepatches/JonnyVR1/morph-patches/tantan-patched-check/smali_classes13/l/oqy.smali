.class public final synthetic Ll/oqy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nqy$d;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/nqy$d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oqy;->a:Ll/nqy$d;

    iput p2, p0, Ll/oqy;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oqy;->a:Ll/nqy$d;

    iget p0, p0, Ll/oqy;->b:I

    invoke-static {v0, p0, p1}, Ll/nqy$d;->y(Ll/nqy$d;ILandroid/view/View;)V

    return-void
.end method
