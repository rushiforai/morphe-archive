.class public final synthetic Ll/d6t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i6t;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/i6t;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d6t;->a:Ll/i6t;

    iput-object p2, p0, Ll/d6t;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d6t;->a:Ll/i6t;

    iget-object p0, p0, Ll/d6t;->b:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/i6t;->Y2(Ll/i6t;Ljava/lang/Runnable;Ljava/lang/Long;)V

    return-void
.end method
