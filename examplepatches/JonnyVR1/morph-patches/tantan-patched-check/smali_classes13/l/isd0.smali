.class public final synthetic Ll/isd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:[Ljava/lang/StackTraceElement;


# direct methods
.method public synthetic constructor <init>([Z[Ljava/lang/StackTraceElement;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/isd0;->a:[Z

    iput-object p2, p0, Ll/isd0;->b:[Ljava/lang/StackTraceElement;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/isd0;->a:[Z

    iget-object p0, p0, Ll/isd0;->b:[Ljava/lang/StackTraceElement;

    invoke-static {v0, p0}, Ll/psd0;->j([Z[Ljava/lang/StackTraceElement;)V

    return-void
.end method
