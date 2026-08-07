.class public final synthetic Ll/yos;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/gps;


# direct methods
.method public synthetic constructor <init>(Ll/gps;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yos;->a:Ll/gps;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yos;->a:Ll/gps;

    invoke-static {p0, p1}, Ll/gps;->I(Ll/gps;Landroid/view/View;)V

    return-void
.end method
