.class public final synthetic Ll/ml2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xl2;

.field public final synthetic b:Ll/uoe0;


# direct methods
.method public synthetic constructor <init>(Ll/xl2;Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ml2;->a:Ll/xl2;

    iput-object p2, p0, Ll/ml2;->b:Ll/uoe0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ml2;->a:Ll/xl2;

    iget-object p0, p0, Ll/ml2;->b:Ll/uoe0;

    invoke-static {v0, p0}, Ll/xl2;->M3(Ll/xl2;Ll/uoe0;)V

    return-void
.end method
