.class public final synthetic Ll/l5u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/m5u0;

.field public final synthetic b:Ll/hpr;


# direct methods
.method public synthetic constructor <init>(Ll/m5u0;Ll/hpr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l5u0;->a:Ll/m5u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l5u0;->b:Ll/hpr;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l5u0;->a:Ll/m5u0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l5u0;->b:Ll/hpr;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/m5u0;->a(Ll/hpr;)Lcom/google/android/gms/internal/ads/zzbze;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
