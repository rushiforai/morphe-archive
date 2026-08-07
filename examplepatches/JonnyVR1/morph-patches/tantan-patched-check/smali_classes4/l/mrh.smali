.class public final synthetic Ll/mrh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/prh$a;


# direct methods
.method public synthetic constructor <init>(Ll/prh$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mrh;->a:Ll/prh$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mrh;->a:Ll/prh$a;

    invoke-static {p0}, Ll/prh$a;->b(Ll/prh$a;)V

    return-void
.end method
