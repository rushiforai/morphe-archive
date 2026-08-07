.class public final synthetic Ll/hw2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uw2;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/uw2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hw2;->a:Ll/uw2;

    iput-object p2, p0, Ll/hw2;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw2;->a:Ll/uw2;

    iget-object p0, p0, Ll/hw2;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/uw2;->w(Ll/uw2;Ljava/lang/String;)V

    return-void
.end method
