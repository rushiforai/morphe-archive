.class public final synthetic Ll/s7x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y7x;

.field public final synthetic b:Ll/syf0;


# direct methods
.method public synthetic constructor <init>(Ll/y7x;Ll/syf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s7x;->a:Ll/y7x;

    iput-object p2, p0, Ll/s7x;->b:Ll/syf0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s7x;->a:Ll/y7x;

    iget-object p0, p0, Ll/s7x;->b:Ll/syf0;

    invoke-static {v0, p0}, Ll/y7x;->k(Ll/y7x;Ll/syf0;)V

    return-void
.end method
