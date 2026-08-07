.class public final synthetic Ll/eyf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dyf0$b;


# direct methods
.method public synthetic constructor <init>(Ll/dyf0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eyf0;->a:Ll/dyf0$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyf0;->a:Ll/dyf0$b;

    invoke-static {p0}, Ll/dyf0$b;->a(Ll/dyf0$b;)V

    return-void
.end method
