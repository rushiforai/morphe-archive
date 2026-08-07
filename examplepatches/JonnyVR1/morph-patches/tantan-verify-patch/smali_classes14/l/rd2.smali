.class public final synthetic Ll/rd2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/ads/AdView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rd2;->a:Lcom/google/android/gms/ads/AdView;

    iput-object p2, p0, Ll/rd2;->b:Ljava/lang/String;

    iput p3, p0, Ll/rd2;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rd2;->a:Lcom/google/android/gms/ads/AdView;

    iget-object v1, p0, Ll/rd2;->b:Ljava/lang/String;

    iget p0, p0, Ll/rd2;->c:I

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Ll/sd2;->a(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;ILl/gcg0;)V

    return-void
.end method
