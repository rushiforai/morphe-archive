.class public final synthetic Ll/fno;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gno;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/gno;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fno;->a:Ll/gno;

    iput p2, p0, Ll/fno;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fno;->a:Ll/gno;

    iget p0, p0, Ll/fno;->b:I

    invoke-static {v0, p0}, Ll/gno;->a(Ll/gno;I)V

    return-void
.end method
