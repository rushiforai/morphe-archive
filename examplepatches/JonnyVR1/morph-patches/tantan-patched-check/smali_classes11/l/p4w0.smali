.class public final synthetic Ll/p4w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f3w0;


# instance fields
.field public final synthetic a:Ll/f5t0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/f5t0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p4w0;->a:Ll/f5t0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p4w0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/p4w0;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p4w0;->a:Ll/f5t0;

    .line 2
    .line 3
    check-cast p1, Ll/t7t0;

    .line 4
    .line 5
    new-instance v1, Ll/j8t0;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/f5t0;->zzc()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v0}, Ll/f5t0;->zzb()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-direct {v1, v2, v0}, Ll/j8t0;-><init>(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/p4w0;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p0, p0, Ll/p4w0;->c:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v1, v0, p0}, Ll/t7t0;->m4(Ll/i7t0;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
