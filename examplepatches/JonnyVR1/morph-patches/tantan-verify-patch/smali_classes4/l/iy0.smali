.class public final synthetic Ll/iy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ll/jy0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/jy0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iy0;->a:Ll/jy0;

    iput p2, p0, Ll/iy0;->b:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/iy0;->a:Ll/jy0;

    iget v1, p0, Ll/iy0;->b:I

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Ll/jy0;->z(Ll/jy0;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
