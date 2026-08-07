.class public final synthetic Ll/jin;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kin;

.field public final synthetic b:Ll/hin;


# direct methods
.method public synthetic constructor <init>(Ll/kin;Ll/hin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jin;->a:Ll/kin;

    iput-object p2, p0, Ll/jin;->b:Ll/hin;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jin;->a:Ll/kin;

    iget-object p0, p0, Ll/jin;->b:Ll/hin;

    invoke-static {v0, p0, p1}, Ll/kin;->r(Ll/kin;Ll/hin;Landroid/view/View;)V

    return-void
.end method
