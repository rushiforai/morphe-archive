.class public final synthetic Ll/ku4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mu4;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/mu4;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ku4;->a:Ll/mu4;

    iput p2, p0, Ll/ku4;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ku4;->a:Ll/mu4;

    iget p0, p0, Ll/ku4;->b:I

    invoke-static {v0, p0}, Ll/mu4;->d(Ll/mu4;I)V

    return-void
.end method
