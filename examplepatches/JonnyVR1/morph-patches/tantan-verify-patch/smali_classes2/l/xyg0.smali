.class public final Ll/xyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/etg0;


# direct methods
.method public constructor <init>(Ll/etg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xyg0;->a:Ll/etg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xyg0;->a:Ll/etg0;

    .line 2
    .line 3
    const-string p1, "click"

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/oxg0;->f(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
