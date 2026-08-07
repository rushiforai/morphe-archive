.class public final synthetic Ll/nho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uho;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/uho;Landroid/content/Intent;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nho;->a:Ll/uho;

    iput-object p2, p0, Ll/nho;->b:Landroid/content/Intent;

    iput p3, p0, Ll/nho;->c:I

    iput p4, p0, Ll/nho;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nho;->a:Ll/uho;

    iget-object v1, p0, Ll/nho;->b:Landroid/content/Intent;

    iget v2, p0, Ll/nho;->c:I

    iget p0, p0, Ll/nho;->d:I

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, v2, p0, p1}, Ll/uho;->h0(Ll/uho;Landroid/content/Intent;IILcom/p1/mobile/android/app/c;)V

    return-void
.end method
