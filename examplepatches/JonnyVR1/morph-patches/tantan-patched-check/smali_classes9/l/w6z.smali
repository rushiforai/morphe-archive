.class public final synthetic Ll/w6z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w6z;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/w6z;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w6z;->a:Ljava/lang/String;

    iget-boolean p0, p0, Ll/w6z;->b:Z

    invoke-static {v0, p0}, Ll/nbz;->w1(Ljava/lang/String;Z)V

    return-void
.end method
