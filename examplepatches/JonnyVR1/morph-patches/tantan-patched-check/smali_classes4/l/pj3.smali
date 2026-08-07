.class public final synthetic Ll/pj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tj3;

.field public final synthetic b:Ll/tj3$a;


# direct methods
.method public synthetic constructor <init>(Ll/tj3;Ll/tj3$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pj3;->a:Ll/tj3;

    iput-object p2, p0, Ll/pj3;->b:Ll/tj3$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pj3;->a:Ll/tj3;

    iget-object p0, p0, Ll/pj3;->b:Ll/tj3$a;

    invoke-static {v0, p0}, Ll/tj3;->b(Ll/tj3;Ll/tj3$a;)V

    return-void
.end method
