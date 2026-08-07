.class public final synthetic Ll/itg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/oug0;

.field public final synthetic b:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ll/oug0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/itg0;->a:Ll/oug0;

    iput-object p2, p0, Ll/itg0;->b:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/itg0;->a:Ll/oug0;

    iget-object p0, p0, Ll/itg0;->b:Ljava/lang/Throwable;

    invoke-virtual {v0, p0}, Ll/oug0;->h(Ljava/lang/Throwable;)V

    return-void
.end method
