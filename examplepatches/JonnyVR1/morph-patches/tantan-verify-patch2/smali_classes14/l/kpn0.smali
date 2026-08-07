.class public final synthetic Ll/kpn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tpn0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/tpn0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kpn0;->a:Ll/tpn0;

    iput p2, p0, Ll/kpn0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kpn0;->a:Ll/tpn0;

    iget p0, p0, Ll/kpn0;->b:I

    invoke-static {v0, p0}, Ll/tpn0;->Z2(Ll/tpn0;I)V

    return-void
.end method
