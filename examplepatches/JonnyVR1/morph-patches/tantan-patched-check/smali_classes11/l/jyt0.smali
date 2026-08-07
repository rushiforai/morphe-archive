.class public final synthetic Ll/jyt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kyt0;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/kyt0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jyt0;->a:Ll/kyt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jyt0;->b:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jyt0;->a:Ll/kyt0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jyt0;->b:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/kyt0;->q(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
