.class public final synthetic Ll/w1k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x1k;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/x1k;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w1k;->a:Ll/x1k;

    iput p2, p0, Ll/w1k;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w1k;->a:Ll/x1k;

    iget p0, p0, Ll/w1k;->b:I

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/x1k;->g0(Ll/x1k;ILjava/lang/Throwable;)V

    return-void
.end method
