.class public final synthetic Ll/wl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xl2;

.field public final synthetic b:Ll/uoe0;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/xl2;Ll/uoe0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wl2;->a:Ll/xl2;

    iput-object p2, p0, Ll/wl2;->b:Ll/uoe0;

    iput p3, p0, Ll/wl2;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wl2;->a:Ll/xl2;

    iget-object v1, p0, Ll/wl2;->b:Ll/uoe0;

    iget p0, p0, Ll/wl2;->c:I

    invoke-static {v0, v1, p0}, Ll/xl2;->T3(Ll/xl2;Ll/uoe0;I)V

    return-void
.end method
