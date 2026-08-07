.class public final synthetic Ll/ddo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/edo;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/edo;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddo;->a:Ll/edo;

    iput-object p2, p0, Ll/ddo;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ddo;->a:Ll/edo;

    iget-object p0, p0, Ll/ddo;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/edo;->b(Ll/edo;Ll/y20;)V

    return-void
.end method
