.class public final Ll/w0v0;
.super Ll/d70;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/google/android/gms/ads/AdView;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/d1v0;


# direct methods
.method public constructor <init>(Ll/d1v0;Ljava/lang/String;Lcom/google/android/gms/ads/AdView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/w0v0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/w0v0;->b:Lcom/google/android/gms/ads/AdView;

    .line 4
    .line 5
    iput-object p4, p0, Ll/w0v0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/w0v0;->d:Ll/d1v0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w0v0;->d:Ll/d1v0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/w0v0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/w0v0;->b:Lcom/google/android/gms/ads/AdView;

    .line 6
    .line 7
    iget-object p0, p0, Ll/w0v0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/d1v0;->s8(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final x(Ll/jtv;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0v0;->d:Ll/d1v0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/d1v0;->p8(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/w0v0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, p1, p0}, Ll/d1v0;->q8(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
