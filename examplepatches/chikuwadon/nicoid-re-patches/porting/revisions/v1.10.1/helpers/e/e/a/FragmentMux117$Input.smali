.class final Le/e/a/FragmentMux117$Input;
.super Ljava/lang/Object;
.source "FragmentMux117.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FragmentMux117;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Input"
.end annotation


# instance fields
.field cursor:Le/e/a/FragmentedMp4117$Cursor;

.field end:J

.field format:Le/e/a/FragmentedMp4117$Format;

.field last:J

.field movie:Le/e/a/FragmentedMp4117;

.field track:I


# direct methods
.method constructor <init>()V
    .registers 3

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/FragmentMux117$Input;->last:J

    return-void
.end method
