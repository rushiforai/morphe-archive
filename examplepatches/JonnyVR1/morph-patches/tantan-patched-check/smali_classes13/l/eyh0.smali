.class public final synthetic Ll/eyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fyh0;

.field public final synthetic b:Ll/dyh0;


# direct methods
.method public synthetic constructor <init>(Ll/fyh0;Ll/dyh0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eyh0;->a:Ll/fyh0;

    iput-object p2, p0, Ll/eyh0;->b:Ll/dyh0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eyh0;->a:Ll/fyh0;

    iget-object p0, p0, Ll/eyh0;->b:Ll/dyh0;

    invoke-static {v0, p0}, Ll/fyh0;->a(Ll/fyh0;Ll/dyh0;)V

    return-void
.end method
