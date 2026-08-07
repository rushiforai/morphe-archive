.class public final synthetic Ll/p4y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/n6y0;

.field public final synthetic b:Ll/c8y0;


# direct methods
.method public synthetic constructor <init>(Ll/n6y0;Ll/c8y0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p4y0;->a:Ll/n6y0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p4y0;->b:Ll/c8y0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p4y0;->a:Ll/n6y0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/p4y0;->b:Ll/c8y0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/n6y0;->C(Ll/c8y0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
