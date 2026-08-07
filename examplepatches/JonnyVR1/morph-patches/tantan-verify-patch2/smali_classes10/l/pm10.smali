.class public final synthetic Ll/pm10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sm10;


# direct methods
.method public synthetic constructor <init>(Ll/sm10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pm10;->a:Ll/sm10;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pm10;->a:Ll/sm10;

    invoke-static {p0, p1}, Ll/sm10;->w(Ll/sm10;Landroid/view/View;)V

    return-void
.end method
