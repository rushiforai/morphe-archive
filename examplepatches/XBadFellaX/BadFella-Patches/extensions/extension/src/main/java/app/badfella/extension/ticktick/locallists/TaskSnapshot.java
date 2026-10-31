package app.badfella.extension.ticktick.locallists;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Allowlisted, serializable copy of the supported parts of a TickTick task.
 *
 * <p>This is intentionally not a Task2/DAO serialization. Numeric database ids,
 * sync etags, access tokens and attachment download paths are excluded. The
 * original project SID is recorded for reference only; recovery always creates
 * a task through TickTick's normal service in Inbox.</p>
 */
public final class TaskSnapshot {
    static final int MAX_TITLE = 10000;
    static final int MAX_CONTENT = 1000000;
    static final int MAX_SID = 200;
    static final int MAX_TZ = 100;
    static final int MAX_REPEAT = 2000;
    static final int MAX_TAGS = 100;
    static final int MAX_TAG = 200;
    static final int MAX_REMINDERS = 50;
    static final int MAX_CHECKLIST = 500;
    static final int MAX_ATTACHMENTS = 200;
    static final int MAX_OMITTED = 50;
    static final int MAX_OMITTED_FIELD = 100;

    private final String sid;
    private final String title;
    private final String content;
    private final String projectSid;
    private final String parentSid;
    private final String timeZone;
    private final String repeatFlag;
    private final int status;
    private final Integer priority;
    private final boolean allDay;
    private final Long startDate;
    private final Long dueDate;
    private final Long completedTime;
    private final Long createdTime;
    private final Long modifiedTime;
    private final Long repeatFirstDate;
    private final Long sortOrder;
    private final List<String> tags;
    private final List<Reminder> reminders;
    private final List<ChecklistItem> checklist;
    private final List<Attachment> attachments;
    private final List<String> omittedFields;

    private TaskSnapshot(Builder builder) {
        this.sid = builder.sid;
        this.title = builder.title;
        this.content = builder.content;
        this.projectSid = builder.projectSid;
        this.parentSid = builder.parentSid;
        this.timeZone = builder.timeZone;
        this.repeatFlag = builder.repeatFlag;
        this.status = builder.status;
        this.priority = builder.priority;
        this.allDay = builder.allDay;
        this.startDate = builder.startDate;
        this.dueDate = builder.dueDate;
        this.completedTime = builder.completedTime;
        this.createdTime = builder.createdTime;
        this.modifiedTime = builder.modifiedTime;
        this.repeatFirstDate = builder.repeatFirstDate;
        this.sortOrder = builder.sortOrder;
        this.tags = Collections.unmodifiableList(new ArrayList<String>(builder.tags));
        this.reminders = Collections.unmodifiableList(new ArrayList<Reminder>(builder.reminders));
        this.checklist = Collections.unmodifiableList(new ArrayList<ChecklistItem>(builder.checklist));
        this.attachments = Collections.unmodifiableList(new ArrayList<Attachment>(builder.attachments));
        this.omittedFields = Collections.unmodifiableList(new ArrayList<String>(builder.omittedFields));
    }

    public static Builder builder(String sid) {
        return new Builder(sid);
    }

    public String getSid() { return sid; }
    public String getTitle() { return title; }
    public String getContent() { return content; }
    public String getProjectSid() { return projectSid; }
    public String getParentSid() { return parentSid; }
    public String getTimeZone() { return timeZone; }
    public String getRepeatFlag() { return repeatFlag; }
    public int getStatus() { return status; }
    public Integer getPriority() { return priority; }
    public boolean isAllDay() { return allDay; }
    public Long getStartDate() { return startDate; }
    public Long getDueDate() { return dueDate; }
    public Long getCompletedTime() { return completedTime; }
    public Long getCreatedTime() { return createdTime; }
    public Long getModifiedTime() { return modifiedTime; }
    public Long getRepeatFirstDate() { return repeatFirstDate; }
    public Long getSortOrder() { return sortOrder; }
    public List<String> getTags() { return tags; }
    public List<Reminder> getReminders() { return reminders; }
    public List<ChecklistItem> getChecklist() { return checklist; }
    public List<Attachment> getAttachments() { return attachments; }
    public List<String> getOmittedFields() { return omittedFields; }

    JSONObject toJson() {
        try {
            JSONObject json = new JSONObject();
            json.put("sid", sid);
            put(json, "title", title);
            put(json, "content", content);
            put(json, "projectSid", projectSid);
            put(json, "parentSid", parentSid);
            put(json, "timeZone", timeZone);
            put(json, "repeatFlag", repeatFlag);
            json.put("status", status);
            if (priority != null) json.put("priority", priority.intValue());
            json.put("allDay", allDay);
            put(json, "startDate", startDate);
            put(json, "dueDate", dueDate);
            put(json, "completedTime", completedTime);
            put(json, "createdTime", createdTime);
            put(json, "modifiedTime", modifiedTime);
            put(json, "repeatFirstDate", repeatFirstDate);
            put(json, "sortOrder", sortOrder);
            JSONArray tagArray = new JSONArray();
            for (String tag : tags) tagArray.put(tag);
            json.put("tags", tagArray);
            JSONArray reminderArray = new JSONArray();
            for (Reminder reminder : reminders) reminderArray.put(reminder.toJson());
            json.put("reminders", reminderArray);
            JSONArray checklistArray = new JSONArray();
            for (ChecklistItem item : checklist) checklistArray.put(item.toJson());
            json.put("checklist", checklistArray);
            JSONArray attachmentArray = new JSONArray();
            for (Attachment attachment : attachments) attachmentArray.put(attachment.toJson());
            json.put("attachments", attachmentArray);
            JSONArray omittedArray = new JSONArray();
            for (String field : omittedFields) omittedArray.put(field);
            json.put("omittedFields", omittedArray);
            return json;
        } catch (JSONException error) {
            throw new IllegalStateException("Could not serialize a task snapshot", error);
        }
    }

    private static void put(JSONObject json, String key, Object value) throws JSONException {
        if (value != null) json.put(key, value);
    }

    static TaskSnapshot fromJson(JSONObject json, String path, JsonFields.FieldSink sink)
            throws BackupException {
        JsonFields.rejectUnknown(json, FIELDS, path, sink);
        Builder builder = builder(JsonFields.requiredString(json, "sid", MAX_SID, path + ".sid"));
        builder.title(JsonFields.optString(json, "title", MAX_TITLE, path + ".title", true));
        builder.content(JsonFields.optString(json, "content", MAX_CONTENT, path + ".content", true));
        builder.projectSid(JsonFields.optString(json, "projectSid", MAX_SID, path + ".projectSid", true));
        builder.parentSid(JsonFields.optString(json, "parentSid", MAX_SID, path + ".parentSid", true));
        builder.timeZone(JsonFields.optString(json, "timeZone", MAX_TZ, path + ".timeZone", true));
        builder.repeatFlag(JsonFields.optString(json, "repeatFlag", MAX_REPEAT, path + ".repeatFlag", true));
        Integer status = JsonFields.optInt(json, "status", 0, 1000, path + ".status");
        builder.status(status == null ? 0 : status.intValue());
        builder.priority(JsonFields.optInt(json, "priority", 0, 5, path + ".priority"));
        builder.allDay(JsonFields.optBoolean(json, "allDay", false, path + ".allDay"));
        builder.startDate(JsonFields.optLong(json, "startDate", 0, JsonFields.MAX_DATE, path + ".startDate"));
        builder.dueDate(JsonFields.optLong(json, "dueDate", 0, JsonFields.MAX_DATE, path + ".dueDate"));
        builder.completedTime(JsonFields.optLong(json, "completedTime", 0, JsonFields.MAX_DATE, path + ".completedTime"));
        builder.createdTime(JsonFields.optLong(json, "createdTime", 0, JsonFields.MAX_DATE, path + ".createdTime"));
        builder.modifiedTime(JsonFields.optLong(json, "modifiedTime", 0, JsonFields.MAX_DATE, path + ".modifiedTime"));
        builder.repeatFirstDate(JsonFields.optLong(json, "repeatFirstDate", 0, JsonFields.MAX_DATE, path + ".repeatFirstDate"));
        builder.sortOrder(JsonFields.optLong(json, "sortOrder", Long.MIN_VALUE, Long.MAX_VALUE, path + ".sortOrder"));

        JSONArray tags = JsonFields.array(json, "tags", path + ".tags");
        if (tags.length() > MAX_TAGS) throw JsonFields.invalid(path + ".tags", "has too many entries");
        for (int i = 0; i < tags.length(); i++) {
            Object tag = tags.opt(i);
            if (!(tag instanceof String) || ((String) tag).isEmpty()
                    || ((String) tag).length() > MAX_TAG) {
                throw JsonFields.invalid(path + ".tags[" + i + "]", "is invalid");
            }
            builder.tag((String) tag);
        }

        JSONArray reminders = JsonFields.array(json, "reminders", path + ".reminders");
        if (reminders.length() > MAX_REMINDERS) {
            throw JsonFields.invalid(path + ".reminders", "has too many entries");
        }
        for (int i = 0; i < reminders.length(); i++) {
            Object value = reminders.opt(i);
            if (!(value instanceof JSONObject)) {
                throw JsonFields.invalid(path + ".reminders[" + i + "]", "must be an object");
            }
            builder.reminder(Reminder.fromJson((JSONObject) value,
                    path + ".reminders[" + i + "]", sink));
        }

        JSONArray checklist = JsonFields.array(json, "checklist", path + ".checklist");
        if (checklist.length() > MAX_CHECKLIST) {
            throw JsonFields.invalid(path + ".checklist", "has too many entries");
        }
        for (int i = 0; i < checklist.length(); i++) {
            Object value = checklist.opt(i);
            if (!(value instanceof JSONObject)) {
                throw JsonFields.invalid(path + ".checklist[" + i + "]", "must be an object");
            }
            builder.checklistItem(ChecklistItem.fromJson((JSONObject) value,
                    path + ".checklist[" + i + "]", sink));
        }

        JSONArray attachments = JsonFields.array(json, "attachments", path + ".attachments");
        if (attachments.length() > MAX_ATTACHMENTS) {
            throw JsonFields.invalid(path + ".attachments", "has too many entries");
        }
        for (int i = 0; i < attachments.length(); i++) {
            Object value = attachments.opt(i);
            if (!(value instanceof JSONObject)) {
                throw JsonFields.invalid(path + ".attachments[" + i + "]", "must be an object");
            }
            builder.attachment(Attachment.fromJson((JSONObject) value,
                    path + ".attachments[" + i + "]", sink));
        }

        JSONArray omitted = JsonFields.array(json, "omittedFields", path + ".omittedFields");
        if (omitted.length() > MAX_OMITTED) {
            throw JsonFields.invalid(path + ".omittedFields", "has too many entries");
        }
        for (int i = 0; i < omitted.length(); i++) {
            Object value = omitted.opt(i);
            if (!(value instanceof String) || ((String) value).length() > MAX_OMITTED_FIELD) {
                throw JsonFields.invalid(path + ".omittedFields[" + i + "]", "is invalid");
            }
            builder.omittedField((String) value);
        }
        return builder.build();
    }

    private static final Set<String> FIELDS = setOf(
            "sid", "title", "content", "projectSid", "parentSid", "timeZone", "repeatFlag",
            "status", "priority", "allDay", "startDate", "dueDate", "completedTime",
            "createdTime", "modifiedTime", "repeatFirstDate", "sortOrder", "tags",
            "reminders", "checklist", "attachments", "omittedFields");

    private static Set<String> setOf(String... values) {
        Set<String> result = new HashSet<String>();
        Collections.addAll(result, values);
        return Collections.unmodifiableSet(result);
    }

    public static final class Reminder {
        private final Long remindTime;
        private final String duration;
        private final boolean allDayTask;

        public Reminder(Long remindTime, String duration, boolean allDayTask) {
            this.remindTime = remindTime;
            this.duration = duration;
            this.allDayTask = allDayTask;
        }

        public Long getRemindTime() { return remindTime; }
        public String getDuration() { return duration; }
        public boolean isAllDayTask() { return allDayTask; }

        JSONObject toJson() {
            try {
                JSONObject json = new JSONObject();
                if (remindTime != null) json.put("remindTime", remindTime.longValue());
                if (duration != null) json.put("duration", duration);
                json.put("allDayTask", allDayTask);
                return json;
            } catch (JSONException error) {
                throw new IllegalStateException("Could not serialize a reminder", error);
            }
        }

        static Reminder fromJson(JSONObject json, String path, JsonFields.FieldSink sink)
                throws BackupException {
            JsonFields.rejectUnknown(json, setOf("remindTime", "duration", "allDayTask"), path, sink);
            return new Reminder(
                    JsonFields.optLong(json, "remindTime", 0, JsonFields.MAX_DATE, path + ".remindTime"),
                    JsonFields.optString(json, "duration", 100, path + ".duration", true),
                    JsonFields.optBoolean(json, "allDayTask", false, path + ".allDayTask"));
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof Reminder)) return false;
            Reminder that = (Reminder) other;
            return allDayTask == that.allDayTask
                    && (remindTime == null ? that.remindTime == null : remindTime.equals(that.remindTime))
                    && (duration == null ? that.duration == null : duration.equals(that.duration));
        }

        @Override
        public int hashCode() {
            int result = remindTime == null ? 0 : remindTime.hashCode();
            result = 31 * result + (duration == null ? 0 : duration.hashCode());
            result = 31 * result + (allDayTask ? 1 : 0);
            return result;
        }
    }

    public static final class ChecklistItem {
        private final String sid;
        private final String title;
        private final boolean checked;
        private final int status;
        private final Long sortOrder;
        private final Long startDate;
        private final boolean allDay;
        private final String timeZone;
        private final Long completedTime;

        public ChecklistItem(String sid, String title, boolean checked, int status,
                Long sortOrder, Long startDate, boolean allDay, String timeZone,
                Long completedTime) {
            this.sid = sid;
            this.title = title;
            this.checked = checked;
            this.status = status;
            this.sortOrder = sortOrder;
            this.startDate = startDate;
            this.allDay = allDay;
            this.timeZone = timeZone;
            this.completedTime = completedTime;
        }

        public String getSid() { return sid; }
        public String getTitle() { return title; }
        public boolean isChecked() { return checked; }
        public int getStatus() { return status; }
        public Long getSortOrder() { return sortOrder; }
        public Long getStartDate() { return startDate; }
        public boolean isAllDay() { return allDay; }
        public String getTimeZone() { return timeZone; }
        public Long getCompletedTime() { return completedTime; }

        JSONObject toJson() {
            try {
                JSONObject json = new JSONObject();
                if (sid != null) json.put("sid", sid);
                if (title != null) json.put("title", title);
                json.put("checked", checked);
                json.put("status", status);
                if (sortOrder != null) json.put("sortOrder", sortOrder.longValue());
                if (startDate != null) json.put("startDate", startDate.longValue());
                json.put("allDay", allDay);
                if (timeZone != null) json.put("timeZone", timeZone);
                if (completedTime != null) json.put("completedTime", completedTime.longValue());
                return json;
            } catch (JSONException error) {
                throw new IllegalStateException("Could not serialize a checklist item", error);
            }
        }

        static ChecklistItem fromJson(JSONObject json, String path, JsonFields.FieldSink sink)
                throws BackupException {
            JsonFields.rejectUnknown(json, setOf("sid", "title", "checked", "status", "sortOrder",
                    "startDate", "allDay", "timeZone", "completedTime"), path, sink);
            return new ChecklistItem(
                    JsonFields.optString(json, "sid", MAX_SID, path + ".sid", true),
                    JsonFields.optString(json, "title", MAX_TITLE, path + ".title", true),
                    JsonFields.optBoolean(json, "checked", false, path + ".checked"),
                    intOrDefault(JsonFields.optInt(json, "status", 0, 1000, path + ".status"), 0),
                    JsonFields.optLong(json, "sortOrder", Long.MIN_VALUE, Long.MAX_VALUE,
                            path + ".sortOrder"),
                    JsonFields.optLong(json, "startDate", 0, JsonFields.MAX_DATE, path + ".startDate"),
                    JsonFields.optBoolean(json, "allDay", false, path + ".allDay"),
                    JsonFields.optString(json, "timeZone", MAX_TZ, path + ".timeZone", true),
                    JsonFields.optLong(json, "completedTime", 0, JsonFields.MAX_DATE,
                            path + ".completedTime"));
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof ChecklistItem)) return false;
            ChecklistItem that = (ChecklistItem) other;
            return checked == that.checked && status == that.status && allDay == that.allDay
                    && equal(sid, that.sid) && equal(title, that.title)
                    && equal(sortOrder, that.sortOrder) && equal(startDate, that.startDate)
                    && equal(timeZone, that.timeZone) && equal(completedTime, that.completedTime);
        }

        @Override
        public int hashCode() {
            int result = sid == null ? 0 : sid.hashCode();
            result = 31 * result + (title == null ? 0 : title.hashCode());
            result = 31 * result + status;
            result = 31 * result + (checked ? 1 : 0);
            return result;
        }
    }

    public static final class Attachment {
        private final String sid;
        private final String fileName;
        private final Long size;
        private final String fileType;
        private final String description;
        private final boolean localBytesAvailable;

        public Attachment(String sid, String fileName, Long size, String fileType,
                String description, boolean localBytesAvailable) {
            this.sid = sid;
            this.fileName = fileName;
            this.size = size;
            this.fileType = fileType;
            this.description = description;
            this.localBytesAvailable = localBytesAvailable;
        }

        public String getSid() { return sid; }
        public String getFileName() { return fileName; }
        public Long getSize() { return size; }
        public String getFileType() { return fileType; }
        public String getDescription() { return description; }
        public boolean isLocalBytesAvailable() { return localBytesAvailable; }

        JSONObject toJson() {
            try {
                JSONObject json = new JSONObject();
                if (sid != null) json.put("sid", sid);
                if (fileName != null) json.put("fileName", fileName);
                if (size != null) json.put("size", size.longValue());
                if (fileType != null) json.put("fileType", fileType);
                if (description != null) json.put("description", description);
                json.put("localBytesAvailable", localBytesAvailable);
                return json;
            } catch (JSONException error) {
                throw new IllegalStateException("Could not serialize an attachment", error);
            }
        }

        static Attachment fromJson(JSONObject json, String path, JsonFields.FieldSink sink)
                throws BackupException {
            JsonFields.rejectUnknown(json, setOf("sid", "fileName", "size", "fileType",
                    "description", "localBytesAvailable"), path, sink);
            return new Attachment(
                    JsonFields.optString(json, "sid", MAX_SID, path + ".sid", true),
                    JsonFields.optString(json, "fileName", MAX_TITLE, path + ".fileName", true),
                    JsonFields.optLong(json, "size", 0, Long.MAX_VALUE, path + ".size"),
                    JsonFields.optString(json, "fileType", 100, path + ".fileType", true),
                    JsonFields.optString(json, "description", MAX_CONTENT, path + ".description", true),
                    JsonFields.optBoolean(json, "localBytesAvailable", false,
                            path + ".localBytesAvailable"));
        }

        @Override
        public boolean equals(Object other) {
            if (!(other instanceof Attachment)) return false;
            Attachment that = (Attachment) other;
            return localBytesAvailable == that.localBytesAvailable
                    && equal(sid, that.sid) && equal(fileName, that.fileName)
                    && equal(size, that.size) && equal(fileType, that.fileType)
                    && equal(description, that.description);
        }

        @Override
        public int hashCode() {
            int result = sid == null ? 0 : sid.hashCode();
            result = 31 * result + (fileName == null ? 0 : fileName.hashCode());
            return result;
        }
    }

    private static boolean equal(Object left, Object right) {
        return left == null ? right == null : left.equals(right);
    }

    private static int intOrDefault(Integer value, int fallback) {
        return value == null ? fallback : value.intValue();
    }

    @Override
    public boolean equals(Object other) {
        if (!(other instanceof TaskSnapshot)) return false;
        TaskSnapshot that = (TaskSnapshot) other;
        return status == that.status && allDay == that.allDay
                && equal(sid, that.sid) && equal(title, that.title)
                && equal(content, that.content) && equal(projectSid, that.projectSid)
                && equal(parentSid, that.parentSid) && equal(timeZone, that.timeZone)
                && equal(repeatFlag, that.repeatFlag) && equal(priority, that.priority)
                && equal(startDate, that.startDate) && equal(dueDate, that.dueDate)
                && equal(completedTime, that.completedTime) && equal(createdTime, that.createdTime)
                && equal(modifiedTime, that.modifiedTime) && equal(repeatFirstDate, that.repeatFirstDate)
                && equal(sortOrder, that.sortOrder) && tags.equals(that.tags)
                && reminders.equals(that.reminders) && checklist.equals(that.checklist)
                && attachments.equals(that.attachments)
                && omittedFields.equals(that.omittedFields);
    }

    @Override
    public int hashCode() {
        int result = sid.hashCode();
        result = 31 * result + status;
        result = 31 * result + (allDay ? 1 : 0);
        result = 31 * result + (title == null ? 0 : title.hashCode());
        return result;
    }

    @Override
    public String toString() {
        return "TaskSnapshot{" + sid + ", " + title + "}";
    }

    public static final class Builder {
        private final String sid;
        private String title;
        private String content;
        private String projectSid;
        private String parentSid;
        private String timeZone;
        private String repeatFlag;
        private int status;
        private Integer priority;
        private boolean allDay;
        private Long startDate;
        private Long dueDate;
        private Long completedTime;
        private Long createdTime;
        private Long modifiedTime;
        private Long repeatFirstDate;
        private Long sortOrder;
        private final List<String> tags = new ArrayList<String>();
        private final List<Reminder> reminders = new ArrayList<Reminder>();
        private final List<ChecklistItem> checklist = new ArrayList<ChecklistItem>();
        private final List<Attachment> attachments = new ArrayList<Attachment>();
        private final List<String> omittedFields = new ArrayList<String>();

        private Builder(String sid) {
            this.sid = sid;
        }

        public Builder title(String value) { title = value; return this; }
        public Builder content(String value) { content = value; return this; }
        public Builder projectSid(String value) { projectSid = value; return this; }
        public Builder parentSid(String value) { parentSid = value; return this; }
        public Builder timeZone(String value) { timeZone = value; return this; }
        public Builder repeatFlag(String value) { repeatFlag = value; return this; }
        public Builder status(int value) { status = value; return this; }
        public Builder priority(Integer value) { priority = value; return this; }
        public Builder allDay(boolean value) { allDay = value; return this; }
        public Builder startDate(Long value) { startDate = value; return this; }
        public Builder dueDate(Long value) { dueDate = value; return this; }
        public Builder completedTime(Long value) { completedTime = value; return this; }
        public Builder createdTime(Long value) { createdTime = value; return this; }
        public Builder modifiedTime(Long value) { modifiedTime = value; return this; }
        public Builder repeatFirstDate(Long value) { repeatFirstDate = value; return this; }
        public Builder sortOrder(Long value) { sortOrder = value; return this; }
        public Builder tag(String value) { tags.add(value); return this; }
        public Builder reminder(Reminder value) { reminders.add(value); return this; }
        public Builder checklistItem(ChecklistItem value) { checklist.add(value); return this; }
        public Builder attachment(Attachment value) { attachments.add(value); return this; }
        public Builder omittedField(String value) { omittedFields.add(value); return this; }

        public TaskSnapshot build() {
            if (sid == null || sid.trim().isEmpty()) {
                throw new IllegalArgumentException("A task SID is required");
            }
            return new TaskSnapshot(this);
        }
    }
}
