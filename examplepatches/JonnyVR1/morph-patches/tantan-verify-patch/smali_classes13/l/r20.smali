.class public final synthetic Ll/r20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/s20$a;


# direct methods
.method public synthetic constructor <init>(Ll/s20$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r20;->a:Ll/s20$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r20;->a:Ll/s20$a;

    invoke-static {p0}, Ll/s20$a;->a(Ll/s20$a;)V

    return-void
.end method
