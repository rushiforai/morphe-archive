.class public final synthetic Ll/umk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rnk0$b;


# direct methods
.method public synthetic constructor <init>(Ll/rnk0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/umk0;->a:Ll/rnk0$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umk0;->a:Ll/rnk0$b;

    invoke-static {p0}, Ll/rnk0;->c(Ll/rnk0$b;)V

    return-void
.end method
