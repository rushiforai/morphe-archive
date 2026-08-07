.class public final synthetic Ll/rtt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ll/dut0;

.field public final synthetic b:Landroid/net/Uri$Builder;


# direct methods
.method public synthetic constructor <init>(Ll/dut0;Landroid/net/Uri$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rtt0;->a:Ll/dut0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rtt0;->b:Landroid/net/Uri$Builder;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rtt0;->a:Ll/dut0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rtt0;->b:Landroid/net/Uri$Builder;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Throwable;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/dut0;->d(Landroid/net/Uri$Builder;Ljava/lang/Throwable;)Ll/hpr;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
